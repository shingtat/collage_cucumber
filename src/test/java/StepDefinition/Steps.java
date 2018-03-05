package StepDefinition;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Steps {				

	WebDriver driver;
    
    @Given("^Open the Firefox and launch the application$")				
    public void open_the_Firefox_and_launch_the_application() throws Throwable							
    {		
    	System.setProperty("webdriver.chrome.driver", "/Users/Master/Documents/workspace/Implementation/chromedriver");
    	driver = new ChromeDriver();
    	driver.get("http://www.facebook.com");
        System.out.println("This Step open the Firefox and launch the application.");					
    }		

    @When("^Enter the Username and Password$")					
    public void enter_the_Username_and_Password() throws Throwable 							
    {		
    	driver.findElement(By.id("email")).sendKeys("rystto@gmail.com");
    	driver.findElement(By.id("pass")).sendKeys("123");
       System.out.println("This step enter the Username and Password on the login page.");					
    }		

    @Then("^Reset the credential$")					
    public void Reset_the_credential() throws Throwable 							
    {    		
    	driver.findElement(By.id("loginbutton")).click();
        System.out.println("This step click on the Reset button.");					
    }		

}
