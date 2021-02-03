module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Tracker</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Customers">Customers</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/Issues">Issues</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/Users">Users</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/TestCases">TestCases</a>
                    </li>
                </ul>
            </div>
        </nav>
         
         <div style="background-color: #657b83; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1); border-radius: 4px">
              <div style="max-width: 800px; margin-left: auto; margin-right: auto">
                  <h1 style="margin-bottom: 2rem; font-size: 2rem; font-weight: 300; border-bottom: 1px solid white; padding-bottom: 0.25rem; border-color: hsla(196, 13%, 60%, 1)">
                      Tracker
                  </h1>

                  <h2 style="margin-top: 0; margin-bottom: 0rem; font-weight: 900; font-size: 3rem">
                      This an internal tool for QA Team
                  </h2>

                  <p style="margin-top: 1rem; font-size: 1.75rem; font-weight: 600; color:hsla(196, 13%, 80%, 1)">
                     To begin, choose an option from the top menu
                  </p>

              </div>
         </div>

|]