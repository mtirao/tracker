module Web.View.Issues.Dated where
import Web.View.Prelude

data DatedView = DatedView { issue :: Issue}

 
instance View DatedView where 
    html DatedView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Estimate Issue: {(get #number issue)} - {(get #summary issue)}</li>
            </ol>
        </nav>
        <h1>Plan Issue</h1>  
        {(get #status issue)}
        {renderForm issue}  
    |]

renderForm :: Issue  -> Html
renderForm issue = formFor issue [hsx|
    {(dateField #startDate)}
    {(textareaField #description)} 
    {(hiddenField #status)}
    {(hiddenField #customerId)}
    {submitButton}
|] 




