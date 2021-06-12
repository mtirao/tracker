module Web.View.Issues.Dated where
import Web.View.Prelude
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

data DatedView = DatedView { issue :: Issue}

 
instance View DatedView where 
    html DatedView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Dated Issue:{(get #number issue)}&nbsp;- {(get #summary issue)}</li>
            </ol>
        </nav>
        <h1>Plan Issue</h1>  
        <p>Effort in days: {(get #days issue)}</p>
        {renderForm issue}  
    |]

renderForm :: Issue  -> Html
renderForm issue = formFor issue [hsx|
    {(dateField #startDate) { fieldInput = (\fieldInput -> H.input ! A.onchange "calculateIssueDate()") } }
    {(dateField #issueDate)}
    {(textareaField #description)} 
    {(hiddenField #status)}
    {(hiddenField #customerId)}
    {(hiddenField #days)}
    {submitButton}
|] 




