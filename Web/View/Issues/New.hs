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
                <li class="breadcrumb-item"><a href={IssuesAction}>Issues</a></li>
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
    {(textField #score)}
    {(textField #days)}
    {(textField #description)}
    {(hiddenField #customerId)}
    {submitButton}
|]
