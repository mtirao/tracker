module Web.View.Issues.Asigned where
import Web.View.Prelude

data AsignedView = AsignedView { issue :: Issue, users :: [User]}

instance CanSelect User where
    -- Here we specify that the <option> value should contain a `Id User`
    type SelectValue User = Text  
    -- Here we specify how to transform the model into <option>-value
    selectValue = get #name
    -- And here we specify the <option>-text
    selectLabel = get #name

instance View AsignedView where 
    html AsignedView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Assigned Issue:{(get #number issue)}&nbsp;- {(get #summary issue)}</li>
            </ol>
        </nav>
        <h1>Assign Issue</h1>  
        {renderForm issue users}  
    |]

renderForm :: Issue  -> [User] -> Html
renderForm issue users = formFor issue [hsx|
    {(selectField #assignee users)}
    {(textareaField #description)} 
    {(hiddenField #status)}
    {(hiddenField #customerId)}
    {submitButton}
|] 



