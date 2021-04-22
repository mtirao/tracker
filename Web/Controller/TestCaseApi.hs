{-# LANGUAGE OverloadedStrings #-}

module Web.Controller.TestCaseApi where

import Web.Controller.Prelude
import Web.View.TestCaseApi.Index
import Web.View.TestCaseApi.Show
import Data.Attoparsec.Char8
import Control.Applicative

instance CanRoute TestCaseApiController where
    parseRoute' = do 
        url <- string "/api/v1/testcases/"
        pure TestCaseApiAction

instance HasPath TestCaseApiController where
    pathTo TestCaseApiAction  = "/api/v1/testcases/"
    
instance Controller TestCaseApiController where
    action TestCaseApiAction = do
        testCaseApi <- query @TestCase|> fetch
        render IndexView { .. }

    action ShowTestCaseApiAction { testCaseId } = do
        testCase <- fetch testCaseId
        render ShowView { .. }

 
