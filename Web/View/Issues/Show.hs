module Web.View.Issues.Show where
import Web.View.Prelude

data ShowView = ShowView { issue :: Issue }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={IssuesAction}>Issues</a></li>
                <li class="breadcrumb-item active">Show Issue</li>
            </ol>
        </nav>
        <h1>Show Issue</h1>
        <p>{issue}</p>
    |]
