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
            {forEach issues renderIssue}
        </div>
    |]


renderIssue issue = [hsx|

    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{(get #number issue)} &nbsp; {((get #summary issue))}</h6>
            <small class="text-muted"><a href={ShowIssueAction (get #id issue)}>Show</a>&nbsp;</small>
            <small class="text-muted"><a href={EditIssueAction (get #id issue)} class="text-muted">Edit</a>&nbsp;</small>
            <small class="text-muted"><a href={ChangeStatusIssueAction (get #id issue)} class="text-muted">Update</a>&nbsp;</small>
            <small class="text-muted"><a href={DeleteIssueAction (get #id issue)} class="js-delete text-muted">Delete</a>&nbsp;</small>
            </div>
        </li>
    </ul>
|]
