module Web.View.Customers.Edit where
import Web.View.Prelude

data EditView = EditView { customer :: Customer }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Edit Customer</li>
            </ol>
        </nav>
        <h1>Edit Customer</h1>
        {renderForm customer}
    |]

renderForm :: Customer -> Html
renderForm customer = formFor customer [hsx|
    {(textField #name)}
    {submitButton}
|]
