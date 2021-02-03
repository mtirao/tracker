module Web.View.Customers.Index where
import Web.View.Prelude

data IndexView = IndexView { customers :: [Customer] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CustomersAction}>Customers</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewCustomerAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Customer</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach customers renderCustomer}</tbody>
            </table>
        </div>
    |]


renderCustomer customer = [hsx|
    <tr>
        <td>{get #name customer}</td>
        <td><a href={ShowCustomerAction (get #id customer)}>Show</a></td>
        <td><a href={EditCustomerAction (get #id customer)} class="text-muted">Edit</a></td>
        <td><a href={DeleteCustomerAction (get #id customer)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
