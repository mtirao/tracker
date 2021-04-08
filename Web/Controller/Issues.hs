module Web.Controller.Issues where

import Web.Controller.Prelude
import Web.View.Issues.Index
import Web.View.Issues.New
import Web.View.Issues.Edit
import Web.View.Issues.Show

instance Controller IssuesController where
    action IssuesAction = do
        issues <- query @Issue |> fetch
        render IndexView { .. }

    action NewIssueAction { customerId } = do
        let issue = newRecord
                |> set #customerId customerId
        customer <- fetch customerId
        render NewView { .. }

    action ShowIssueAction { issueId } = do
        issue <- fetch issueId
        render ShowView { .. }

    action EditIssueAction { issueId } = do
        issue <- fetch issueId
        render EditView { .. }

    action UpdateIssueAction { issueId } = do
        issue <- fetch issueId
        issue
            |> buildIssue
            |> ifValid \case
                Left issue -> render EditView { .. }
                Right issue -> do
                    issue <- issue |> updateRecord
                    setSuccessMessage "Issue updated"
                    redirectTo EditIssueAction { .. }

    action CreateIssueAction = do
        let issue = newRecord @Issue
        issue
            |> buildIssue
            |> ifValid \case
                Left issue -> do
                    customer <- fetch (get #customerId issue)
                    render NewView { .. } 
                Right issue -> do
                    issue <- issue |> createRecord
                    setSuccessMessage "Issue created"
                    redirectTo IssuesAction

    action DeleteIssueAction { issueId } = do
        issue <- fetch issueId
        deleteRecord issue
        setSuccessMessage "Issue deleted"
        redirectTo IssuesAction

buildIssue issue = issue
    |> fill @["number","summary","status","isPsa","days","description","customerId", "startDate", "issueDate", "isDefect"]
