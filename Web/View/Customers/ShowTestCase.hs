module Web.View.Customers.ShowTestCase where
import Web.View.Prelude

data ShowTestCaseView = ShowTestCaseView { customer :: Customer, testCases :: [TestCase] }

instance View ShowTestCaseView where
    html ShowTestCaseView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Show Customer</li>
            </ol>
        </nav>
        <h1>{get #name customer} <a href={NewTestCaseAction (get #id customer)} class="btn btn-primary ml-4">+Test Case</a></h1>
        
        <div class="table-responsive">
            {forEach testCases renderTestCases}
        </div>
    |]


renderTestCases testCase = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{(get #number testCase)}-{((get #name testCase))}</h6>
            <small class="text-muted"><a href={ShowTestCaseAction (get #id testCase)}>Show</a>&nbsp;</small>
            <small class="text-muted"><a href={EditTestCaseAction (get #id testCase)} class="text-muted">Edit</a>&nbsp;</small>
            <small class="text-muted"><a href={DeleteTestCaseAction (get #id testCase)} class="js-delete text-muted">Delete</a>&nbsp;</small>
            </div>
        </li>
    </ul>
|]