module Web.View.Customers.Index where
import Web.View.Prelude

data IndexView = IndexView { customers :: [Customer] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewCustomerAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            {forEach customers renderCustomer}
        </div>
    |]


renderCustomer customer = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{get #name customer}</h6>
            <small class="text-muted"><a href={NewIssueAction (get #id customer)}>Add Issue&nbsp;</a></small>
            <small class="text-muted"><a href={ShowCustomerAction (get #id customer)}>Show&nbsp;</a></small>
            <small class="text-muted"><a href={ShowCustomerTestCaseAction (get #id customer)}>Test Cases&nbsp;</a></small>
            <small class="text-muted"><a href={EditCustomerAction (get #id customer)} class="text-muted">Edit&nbsp;</a></small>
            <small class="text-muted"><a href={DeleteCustomerAction (get #id customer)} class="js-delete text-muted">Delete</a></small>
            </div>
        </li>
    </ul>
|]
