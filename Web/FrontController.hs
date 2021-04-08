module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.IssueStates
import Web.Controller.TestCases
import Web.Controller.Users
import Web.Controller.Issues
import Web.Controller.Customers
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @IssueStatesController
        , parseRoute @TestCasesController
        , parseRoute @UsersController
        , parseRoute @IssuesController
        , parseRoute @CustomersController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
