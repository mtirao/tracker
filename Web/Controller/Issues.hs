module Web.Controller.Issues where

import Web.Controller.Prelude
import Web.View.Issues.Index
import Web.View.Issues.New
import Web.View.Issues.Edit
import Web.View.Issues.Show
import Web.View.Issues.Estimate
import Web.View.Issues.Dated
import Web.View.Issues.Asigned
import qualified Data.Text as T
import qualified Data.Time.Format as LT

instance Controller IssuesController where
    action IssuesAction = do
        issues <- query @Issue |> fetch
        render IndexView { .. }

    action NewIssueAction { customerId } = do
        let issue = newRecord
                |> set #customerId customerId
                |> set #status "new"
        customer <- fetch customerId
        render NewView { .. }

    action ShowIssueAction { issueId } = do
        issue <- fetch issueId
        customer <- fetch (get #customerId issue)

        let issueDate = case (get #issueDate issue) of
                         Just a -> LT.formatTime LT.defaultTimeLocale "%0Y-%m-%d" a 
                         Nothing -> ""
        let startDate = case (get #startDate issue) of
                         Just a -> LT.formatTime LT.defaultTimeLocale "%0Y-%m-%d" a 
                         Nothing -> ""
        render ShowView { .. }

    action EditIssueAction { issueId } = do
        issue <- fetch issueId
        users <- query @User |> fetch
        states <- query @IssueState |> fetch
        render EditView { .. }

    action ChangeStatusIssueAction { issueId } = do
        issue <- fetch issueId
        users <- query @User |> fetch
        states <- query @IssueState |> fetch

        case (get #status issue) of
            "new" -> do 
                let new_issue = issue |> set #status "estimate"
                render EstimateView { issue = new_issue }
            "estimate" -> do
                let new_issue = issue |> set #status "planned"
                render DatedView { issue = new_issue }
            "planned" -> do
                let new_issue = issue |> set #status "assigned"
                render AsignedView { issue = new_issue, users = users }
            "assigned" -> render EditView { .. }

            "" -> render EditView { .. }

    action UpdateIssueAction { issueId } = do
        issue <- fetch issueId
        users <- query @User |> fetch
        states <- query @IssueState |> fetch
        issue
            |> buildIssue
            |> ifValid \case
                Left issue -> render EditView { .. }
                Right issue -> do
                    issue <- issue |> updateRecord
                    setSuccessMessage "Issue updated"
                    redirectTo ShowCustomerAction { customerId = get #customerId issue }

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
                    redirectTo CustomersAction

    action DeleteIssueAction { issueId } = do
        issue <- fetch issueId
        deleteRecord issue
        setSuccessMessage "Issue deleted"
        redirectTo IssuesAction

buildIssue issue = issue
    |> fill @["number","summary","status","isPsa","days","description","customerId", "startDate", "issueDate", "isDefect", "assignee"]
