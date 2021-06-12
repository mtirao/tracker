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
        , "issue" .= get #issue testCase
        , "config" .= get #config testCase
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

 
