module Web.View.Issues.Show where
import Web.View.Prelude

data ShowView = ShowView { issue :: Issue }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active">Show Issue</li>
            </ol>
        </nav>

         <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Mantis</h6>
                <small class="text-muted">{(get #number issue)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Summary</h6>
                <small class="text-muted">{(get #summary issue)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Estimate effort (in days)</h6>
                <small class="text-muted">{(get #days issue)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Status</h6>
                <small class="text-muted">{(get #status issue)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Asignee</h6>
                <small class="text-muted">{(get #assignee issue)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Description</h6>
                <small class="text-muted">{(get #description issue)}</small>
              </div>
            </li>
          </ul>

    |]
