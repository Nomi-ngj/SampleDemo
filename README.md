# SampleDemo
This is a Swift-based iOS app that uses the MVVM architecture pattern to display a list of products and their details.

**Architecture**
The app follows the Model-View-ViewModel (MVVM) architecture pattern. The app's components include:

**Model**: The product model contains the properties of a product, such as name, description, price, and image. The app retrieves this data from a remote server using a data service.

**View**: The product list view displays a list of products using a table view. Each cell in the table view displays the name and image of the product. Tapping a cell navigates to the product detail view.

**ViewModel**: The product list view model fetches the product data from the data service and converts it into a format that the product list view can display. The product detail view model fetches the data for a specific product and formats it for the product detail view.

**Binding**: The product list view model binds the product list view with the product data. The product detail view model binds the product detail view with the product data, allowing the view to update with any changes.

# Setup
To set up and run the app, follow these steps:

Clone the repository to your local machine.
Open the project in Xcode.
Install any dependencies by running pod install in the terminal.
Build and run the app in the simulator or on a physical device.
Testing
The app includes unit tests for the view models. To run the tests, follow these steps:

Open the project in Xcode.
Select the SampleDemoTests scheme.
Press Cmd+U to run the tests.

# Screenshots Demo


**Product List**

  <a href="">
        <img src="https://user-images.githubusercontent.com/17121200/235238029-a84bf753-1f78-4c61-b8c6-4deaa02eb801.png" alt="Logo" width="300" height="650">
  </a>


**Product Details**

**Note**
Not sure why the image url's are not working in the detail screen.

  <a href="">
    <img src="https://user-images.githubusercontent.com/17121200/235238169-1ff3728f-ce57-4a40-ae9e-4f1fa9bfb20e.png" alt="Logo" width="300" height="650">
  </a>
