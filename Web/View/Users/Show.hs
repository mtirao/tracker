module Web.View.Users.Show where
import Web.View.Prelude

data ShowView = ShowView { user :: User, issues :: [Issue] }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Show User</li>
            </ol>
        </nav>
        <h1>Show User</h1>
        <div class="table-responsive">
            {forEach issues renderIssue}
        </div>
    |]

renderIssue issue = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{(get #number issue)} &nbsp; {((get #summary issue))}</h6>
            <h6 class="text-muted">Current state: {(get #status issue)}</h6>
            <small class="text-muted"><a href={ShowIssueAction (get #id issue)}>Show</a>&nbsp;</small>
            <small class="text-muted"><a href={EditIssueAction (get #id issue)} class="text-muted">Edit</a>&nbsp;</small>
            <small class="text-muted"><a href={ChangeStatusIssueAction (get #id issue)} class="text-muted">Update</a>&nbsp;</small>
            <small class="text-muted"><a href={DeleteIssueAction (get #id issue)} class="js-delete text-muted">Delete</a>&nbsp;</small>
            </div>
        </li>
    </ul>
|]