module Web.View.TestCases.Index where
import Web.View.Prelude

data IndexView = IndexView { testCases :: [TestCase] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewTestCaseActionWithoutCustomer} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            {forEach testCases renderTestCase}
        </div>
    |]


renderTestCase testCase = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">tc{get #number testCase}-{get #name testCase}</h6>
            <small class="text-muted"><a href={ShowTestCaseAction (get #id testCase)}>Show&nbsp;</a></small>
            <small class="text-muted"><a href={EditTestCaseAction (get #id testCase)} class="text-muted">Edit&nbsp;</a></small>
            <small class="text-muted"><a href={DeleteTestCaseAction (get #id testCase)} class="js-delete text-muted">Delete</a></small>
            </div>
        </li>
    </ul>
|]

