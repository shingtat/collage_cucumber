package TestRunner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
//@Runwith() annotation tells about the test runner class to start executing our tests

@CucumberOptions(features="Features", glue={"StepDefinition"})
//Setting properties for cucumber tests like feature file and step definition.

public class Runner {

}
