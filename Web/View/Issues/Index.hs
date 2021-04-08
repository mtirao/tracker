module Web.View.Issues.Index where
import Web.View.Prelude

data IndexView = IndexView { issues :: [Issue] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
            </ol>
        </nav>
        <h1>Issues</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Issue</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach issues renderIssue}</tbody>
            </table>
        </div>
    |]


renderIssue issue = [hsx|
    <tr>
        <td>{(get #number issue)}</td> 
        <td>{((get #summary issue))}</td>
        <td><a href={ShowIssueAction (get #id issue)}>Show</a></td>
        <td><a href={EditIssueAction (get #id issue)} class="text-muted">Edit</a></td>
        <td><a href={DeleteIssueAction (get #id issue)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
