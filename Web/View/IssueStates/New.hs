module Web.View.IssueStates.New where
import Web.View.Prelude

data NewView = NewView { issueState :: IssueState }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IssueStatesAction}>IssueStates</a></li>
                <li class="breadcrumb-item active">New IssueState</li>
            </ol>
        </nav>
        <h1>New IssueState</h1>
        {renderForm issueState}
    |]

renderForm :: IssueState -> Html
renderForm issueState = formFor issueState [hsx|
    {(textField #name)}
    {submitButton}
|]
