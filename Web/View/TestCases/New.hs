module Web.View.TestCases.New where
import Web.View.Prelude

data NewView = NewView { testCase :: TestCase }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">New TestCase</li>
            </ol>
        </nav>
        <h1>New TestCase</h1>
        {renderForm testCase}
    |]

renderForm :: TestCase -> Html
renderForm testCase = formFor testCase [hsx|
    {(textField #name)}
    {(textField #number)}
    {(textField #issue)}
    {(textField #config)}
    {(textareaField #gherking)}
    {(hiddenField #customerId)}
    {submitButton}
|]
