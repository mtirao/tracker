module Web.View.Customers.New where
import Web.View.Prelude

data NewView = NewView { customer :: Customer }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CustomersAction}>Customers</a></li>
                <li class="breadcrumb-item active">New Customer</li>
            </ol>
        </nav>
        <h1>New Customer</h1>
        {renderForm customer}
    |]

renderForm :: Customer -> Html
renderForm customer = formFor customer [hsx|
    {(textField #name)}
    {submitButton}
|]
