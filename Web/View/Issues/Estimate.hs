module Web.View.Issues.Estimate where
import Web.View.Prelude

data EstimateView = EstimateView { issue :: Issue}

 
instance View EstimateView where 
    html EstimateView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Estimate Issue: {(get #number issue)}&nbsp;- {(get #summary issue)}</li>
            </ol>
        </nav>
        <h1>Estimate Issue</h1>  
        {renderForm issue}  
    |]

renderForm :: Issue  -> Html
renderForm issue = formFor issue [hsx|
    {(textField #days)}
    {(textareaField #description)} 
    {(hiddenField #status)}
    {(hiddenField #customerId)}
    {submitButton}
|] 



