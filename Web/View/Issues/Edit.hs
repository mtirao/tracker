module Web.View.Issues.Edit where
import Web.View.Prelude

data EditView = EditView { issue :: Issue }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IssuesAction}>Issues</a></li>
                <li class="breadcrumb-item active">Edit Issue</li>
            </ol>
        </nav>
        <h1>Edit Issue</h1>
        {renderForm issue}
    |]

renderForm :: Issue -> Html
renderForm issue = formFor issue [hsx|
    {(textField #number)}
    {(textField #summary)}
    {(textField #status)}
    {(checkboxField #isPsa)}
    {(textField #days)}
    {(textField #description)}
    {(textField #customerId)}
    {submitButton}
|]
