module Web.View.Issues.Edit where
import Web.View.Prelude

data EditView = EditView { issue :: Issue, users :: [User], states :: [IssueState] }

instance CanSelect User where
    -- Here we specify that the <option> value should contain a `Id User`
    type SelectValue User = Text  
    -- Here we specify how to transform the model into <option>-value
    selectValue = get #name
    -- And here we specify the <option>-text
    selectLabel = get #name

instance CanSelect IssueState where
    -- Here we specify that the <option> value should contain a `Id User`
    type SelectValue IssueState = Text  
    -- Here we specify how to transform the model into <option>-value
    selectValue = get #name
    -- And here we specify the <option>-text
    selectLabel = get #name

 
instance View EditView where 
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Edit Issue</li>
            </ol>
        </nav>
        <h1>Edit Issue</h1>
        {renderForm issue users states}  
    |]

renderForm :: Issue -> [User] -> [IssueState] -> Html
renderForm issue users states = formFor issue [hsx|
    {(textField #number)}
    {(textField #summary)}
    {(selectField #status states)}
    {(checkboxField #isPsa)}
    {(textField #days)}
    {(textField #description)} 
    {(hiddenField #customerId)}
    {(selectField #assignee users)}
    {submitButton}
|] 
 
renderUser user = [hsx|
    <tr>
        <td>{get #name user}</td>
        <td><a href={ShowUserAction (get #id user)}>Show</a></td>
        <td><a href={EditUserAction (get #id user)} class="text-muted">Edit</a></td>
        <td><a href={DeleteUserAction (get #id user)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]


