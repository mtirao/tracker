module Web.View.TestCaseApi.Index where
import Web.View.Prelude

data IndexView = IndexView { testCaseApi :: [TestCase] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TestCaseApiAction}>TestCaseApis</a></li>
            </ol>
        </nav>
        <h1>Index</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TestCaseApi</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
    |]

