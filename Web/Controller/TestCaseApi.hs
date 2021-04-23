{-# LANGUAGE OverloadedStrings #-}

module Web.Controller.TestCaseApi where

import Web.Controller.Prelude
import Web.View.TestCaseApi.Show
import Data.Attoparsec.Char8
import Control.Applicative


instance CanRoute TestCaseApiController where
    parseRoute' = do 
        customerId <- string "/api/v1/testcases/" *> parseId <* "/customer/"
        pure TestCaseApiAction{customerId}

instance HasPath TestCaseApiController where
    pathTo TestCaseApiAction { customerId }  = "/api/v1/testcases/" <> tshow customerId <> "/customer/"
    

instance ToJSON TestCase where
    toJSON testCase = object
        [ "id" .= get #id testCase
        , "name" .= get #name testCase
        , "number" .= get #number testCase
        , "detail" .= get #detail testCase
        , "issue" .= get #issue testCase
        , "config" .= get #config testCase
        , "operation" .= get #operation testCase
        , "operation_ext" .= get #operationExt testCase
        , "tender" .= get #tender testCase
        , "tender_ext" .= get #tenderExt testCase
        , "dp" .= get #dp testCase
        , "dp_ext" .= get #dpExt testCase
        , "gherking" .= get #gherking testCase
        , "customer" .= get #customerId testCase
        ]

instance Controller TestCaseApiController where
    action TestCaseApiAction { customerId } = do
        testCaseApi <-query @TestCase
            |> queryOr 
                (filterWhere (#customerId, Just customerId)) (filterWhere (#customerId, Nothing))
            |> fetch
        renderJson (toJSON testCaseApi)

    action ShowTestCaseApiAction { testCaseId } = do
        testCase <- fetch testCaseId
        render ShowView { .. }

 
