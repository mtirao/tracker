module Web.View.TestCases.Index where
import Web.View.Prelude

data IndexView = IndexView { testCases :: [TestCase] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TestCasesAction}>TestCases</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTestCaseAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TestCase</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach testCases renderTestCase}</tbody>
            </table>
        </div>
    |]


renderTestCase testCase = [hsx|
    <tr>
        <td>{testCase}</td>
        <td><a href={ShowTestCaseAction (get #id testCase)}>Show</a></td>
        <td><a href={EditTestCaseAction (get #id testCase)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTestCaseAction (get #id testCase)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
