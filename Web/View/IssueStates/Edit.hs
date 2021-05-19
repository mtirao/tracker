module Web.View.IssueStates.Edit where
import Web.View.Prelude

data EditView = EditView { issueState :: IssueState }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IssueStatesAction}>IssueStates</a></li>
                <li class="breadcrumb-item active">Edit IssueState</li>
            </ol>
        </nav>
        <h1>Edit IssueState</h1>
        {renderForm issueState}
    |]

renderForm :: IssueState -> Html
renderForm issueState = formFor issueState [hsx|
    {(textField #name)}
    {submitButton}
|]
