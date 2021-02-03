module Web.View.TestCases.Edit where
import Web.View.Prelude

data EditView = EditView { testCase :: TestCase }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TestCasesAction}>TestCases</a></li>
                <li class="breadcrumb-item active">Edit TestCase</li>
            </ol>
        </nav>
        <h1>Edit TestCase</h1>
        {renderForm testCase}
    |]

renderForm :: TestCase -> Html
renderForm testCase = formFor testCase [hsx|
    {(textField #name)}
    {(textField #number)}
    {(textField #detail)}
    {(textField #issue)}
    {(textField #config)}
    {submitButton}
|]
