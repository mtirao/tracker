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
        <p>{testCase}</p>
    |]
