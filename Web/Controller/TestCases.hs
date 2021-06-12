module Web.Controller.TestCases where

import Web.Controller.Prelude
import Web.View.TestCases.Index
import Web.View.TestCases.New
import Web.View.TestCases.Edit
import Web.View.TestCases.Show
import qualified Data.Text as T

instance Controller TestCasesController where
    action TestCasesAction = do
        testCases <- query @TestCase |> fetch
        render IndexView { .. }


    action NewTestCaseActionWithoutCustomer = do
        let testCase = newRecord
        render NewView { .. }

    action NewTestCaseAction {customerId} = do
        let testCase = newRecord
                    |> set #customerId (Just customerId)
        render NewView { .. }

    action ShowTestCaseAction { testCaseId } = do
        testCase <- fetch testCaseId
        let lines = T.splitOn "\n" (get #gherking testCase)
        render ShowView { .. }

    action EditTestCaseAction { testCaseId } = do
        testCase <- fetch testCaseId
        render EditView { .. }

    action UpdateTestCaseAction { testCaseId } = do
        testCase <- fetch testCaseId
        testCase
            |> buildTestCase
            |> ifValid \case
                Left testCase -> render EditView { .. }
                Right testCase -> do
                    testCase <- testCase |> updateRecord
                    setSuccessMessage "TestCase updated"
                    redirectTo EditTestCaseAction { .. }

    action CreateTestCaseAction = do
        let testCase = newRecord @TestCase
        testCase
            |> buildTestCase
            |> ifValid \case
                Left testCase -> do
                    render NewView { .. } 
                Right testCase -> do
                    testCase <- testCase |> createRecord
                    setSuccessMessage "TestCase created"
                    redirectTo TestCasesAction

    action DeleteTestCaseAction { testCaseId } = do
        testCase <- fetch testCaseId
        deleteRecord testCase
        setSuccessMessage "TestCase deleted"
        redirectTo TestCasesAction

buildTestCase testCase = testCase
    |> fill @["name","number","issue","config", "gherking", "customerId"]
