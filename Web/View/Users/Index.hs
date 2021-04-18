module Web.View.Users.Index where
import Web.View.Prelude

data IndexView = IndexView { users :: [User] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
            </ol>
        </nav>
        <h1>Users <a href={pathTo NewUserAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
           {forEach users renderUser}
        </div>
    |]


renderUser user = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{get #name user}</h6>
            <small class="text-muted"><a href={ShowUserAction (get #id user)}>Show</a>&nbsp;</small>
            <small class="text-muted"><a href={EditUserAction (get #id user)} class="text-muted">Edit</a>&nbsp;</small>
            <small class="text-muted"><a href={DeleteUserAction (get #id user)} class="js-delete text-muted">Delete</a>&nbsp;</small>
            </div>
        </li>
    </ul>
|]
