module Web.View.Issues.New where
import Web.View.Prelude

data NewView = NewView 
    { issue :: Issue 
    , customer :: Customer
    }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">New Issue</li>
            </ol>
        </nav>
        <h1>New Issue for <q> {get #name customer} </q> </h1>
        {renderForm issue}
    |]

renderForm :: Issue -> Html
renderForm issue = formFor issue [hsx|
    {(textField #number)}
    {(textField #summary)}
    {(textField #status)}
    {(checkboxField #isPsa)}
    {(textField #days)}
    {(dateField #startDate)}
    {(textField #description)}
    {(hiddenField #customerId)}
    {submitButton}
|]
