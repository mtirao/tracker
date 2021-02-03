module Web.Controller.Customers where

import Web.Controller.Prelude
import Web.View.Customers.Index
import Web.View.Customers.New
import Web.View.Customers.Edit
import Web.View.Customers.Show

instance Controller CustomersController where
    action CustomersAction = do
        customers <- query @Customer |> fetch
        render IndexView { .. }

    action NewCustomerAction = do
        let customer = newRecord
        render NewView { .. }

    action ShowCustomerAction { customerId } = do
        customer <- fetch customerId
        render ShowView { .. }

    action EditCustomerAction { customerId } = do
        customer <- fetch customerId
        render EditView { .. }

    action UpdateCustomerAction { customerId } = do
        customer <- fetch customerId
        customer
            |> buildCustomer
            |> ifValid \case
                Left customer -> render EditView { .. }
                Right customer -> do
                    customer <- customer |> updateRecord
                    setSuccessMessage "Customer updated"
                    redirectTo EditCustomerAction { .. }

    action CreateCustomerAction = do
        let customer = newRecord @Customer
        customer
            |> buildCustomer
            |> ifValid \case
                Left customer -> render NewView { .. } 
                Right customer -> do
                    customer <- customer |> createRecord
                    setSuccessMessage "Customer created"
                    redirectTo CustomersAction

    action DeleteCustomerAction { customerId } = do
        customer <- fetch customerId
        deleteRecord customer
        setSuccessMessage "Customer deleted"
        redirectTo CustomersAction

buildCustomer customer = customer
    |> fill @'["name"]
