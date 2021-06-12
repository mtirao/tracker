module Web.Controller.IssueStates where

import Web.Controller.Prelude
import Web.View.IssueStates.Index
import Web.View.IssueStates.New
import Web.View.IssueStates.Edit
import Web.View.IssueStates.Show

instance Controller IssueStatesController where
    action IssueStatesAction = do
        issueStates <- query @IssueState |> fetch
        render IndexView { .. }

    action NewIssueStateAction = do
        let issueState = newRecord
        render NewView { .. }

    action ShowIssueStateAction { issueStateId } = do
        issueState <- fetch issueStateId
        render ShowView { .. }

    action EditIssueStateAction { issueStateId } = do
        issueState <- fetch issueStateId
        render EditView { .. }

    action UpdateIssueStateAction { issueStateId } = do
        issueState <- fetch issueStateId
        issueState
            |> buildIssueState
            |> ifValid \case
                Left issueState -> render EditView { .. }
                Right issueState -> do
                    issueState <- issueState |> updateRecord
                    setSuccessMessage "IssueState updated"
                    redirectTo EditIssueStateAction { .. }

    action CreateIssueStateAction = do
        let issueState = newRecord @IssueState
        issueState
            |> buildIssueState
            |> ifValid \case
                Left issueState -> render NewView { .. } 
                Right issueState -> do
                    issueState <- issueState |> createRecord
                    setSuccessMessage "IssueState created"
                    redirectTo IssueStatesAction

    action DeleteIssueStateAction { issueStateId } = do
        issueState <- fetch issueStateId
        deleteRecord issueState
        setSuccessMessage "IssueState deleted"
        redirectTo IssueStatesAction

buildIssueState issueState = issueState
    |> fill @'["name"]
