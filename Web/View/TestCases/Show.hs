module Web.View.TestCases.Show where
import Web.View.Prelude

data ShowView = ShowView { testCase :: TestCase }

instance View ShowView where
    html ShowView { .. } = [hsx|
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
                <small class="text-muted">Confgi: {get #config testCase}<br></small>
                </div>
            </li>
        </ul>
    |]
