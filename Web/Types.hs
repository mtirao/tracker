module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data CustomersController
    = CustomersAction
    | NewCustomerAction
    | ShowCustomerAction { customerId :: !(Id Customer) }
    | CreateCustomerAction
    | EditCustomerAction { customerId :: !(Id Customer) }
    | UpdateCustomerAction { customerId :: !(Id Customer) }
    | DeleteCustomerAction { customerId :: !(Id Customer) }
    deriving (Eq, Show, Data)

data IssuesController
    = IssuesAction
    | NewIssueAction { customerId :: !(Id Customer) }
    | ShowIssueAction { issueId :: !(Id Issue) }
    | CreateIssueAction
    | EditIssueAction { issueId :: !(Id Issue) }
    | ChangeStatusIssueAction { issueId :: !(Id Issue) }
    | UpdateIssueAction { issueId :: !(Id Issue) }
    | DeleteIssueAction { issueId :: !(Id Issue) }
    deriving (Eq, Show, Data)

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)

data TestCasesController
    = TestCasesAction
    | NewTestCaseActionWithoutCustomer
    | NewTestCaseAction { customerId :: !(Id Customer) }
    | ShowTestCaseAction { testCaseId :: !(Id TestCase) }
    | CreateTestCaseAction
    | EditTestCaseAction { testCaseId :: !(Id TestCase) }
    | UpdateTestCaseAction { testCaseId :: !(Id TestCase) }
    | DeleteTestCaseAction { testCaseId :: !(Id TestCase) }
    deriving (Eq, Show, Data)

data IssueStatesController
    = IssueStatesAction
    | NewIssueStateAction 
    | ShowIssueStateAction { issueStateId :: !(Id IssueState) }
    | CreateIssueStateAction
    | EditIssueStateAction { issueStateId :: !(Id IssueState) }
    | UpdateIssueStateAction { issueStateId :: !(Id IssueState) }
    | DeleteIssueStateAction { issueStateId :: !(Id IssueState) }
    deriving (Eq, Show, Data)
