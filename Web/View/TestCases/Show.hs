module Web.View.TestCases.Show where
import Web.View.Prelude
import qualified Data.Text as T
import Text.Blaze.Html5

data ShowView = ShowView { testCase :: TestCase, lines :: [Text] }

instance View ShowView where
    html ShowView { .. } =  [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Show TestCase</li>
            </ol>
        </nav>
        <h1>Show TestCase</h1>
        <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                <h6 class="my-0">tc{get #number testCase}-{get #name testCase}</h6>
                <small class="text-muted">Mantis: {get #issue testCase}<br></small>
                <small class="text-muted">Config: {get #config testCase}<br></small>
                <small class="text-muted">Gherking: <br></small>
                {forEach lines renderLines}
                </div>
            </li>
        </ul>
    |]


renderLines line = [hsx|
    <small class="my-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{line}<br></small>
|]
