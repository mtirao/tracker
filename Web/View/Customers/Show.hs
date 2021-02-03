module Web.View.Customers.Show where
import Web.View.Prelude

data ShowView = ShowView { customer :: Customer }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Show Customer</li>
            </ol>
        </nav>
        <h1>{get #name customer}</h1>
        <p>{get #name customer}</p>
        <a href={NewIssueAction (get #id customer)}>Add Issue</a>
    |]
