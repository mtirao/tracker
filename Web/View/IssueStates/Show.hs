module Web.View.IssueStates.Show where
import Web.View.Prelude

data ShowView = ShowView { issueState :: IssueState }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IssueStatesAction}>IssueStates</a></li>
                <li class="breadcrumb-item active">Show IssueState</li>
            </ol>
        </nav>
        <h1>Show IssueState</h1>
        <p>{issueState}</p>
    |]
