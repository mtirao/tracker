module Web.View.IssueStates.Index where
import Web.View.Prelude

data IndexView = IndexView { issueStates :: [IssueState] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={IssueStatesAction}>IssueStates</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewIssueStateAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>IssueState</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach issueStates renderIssueState}</tbody>
            </table>
        </div>
    |]


renderIssueState issueState = [hsx|
    <tr>
        <td>{(get #name issueState)}</td>
        <td><a href={ShowIssueStateAction (get #id issueState)}>Show</a></td>
        <td><a href={EditIssueStateAction (get #id issueState)} class="text-muted">Edit</a></td>
        <td><a href={DeleteIssueStateAction (get #id issueState)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
