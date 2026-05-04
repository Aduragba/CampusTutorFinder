import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CampusTutorFinderTests {

    WebDriver driver;
    String baseUrl = "http://3.151.119.35:8080/CampusTutorFinder/";

    @BeforeEach
    public void setUp() {
        driver = new ChromeDriver();
    }

    @AfterEach
    public void tearDown() {
        driver.quit();
    }

    @Test
    public void testHomePageLoads() {
        driver.get(baseUrl);
        assertTrue(driver.getPageSource().contains("Campus Tutor Finder"));
    }

    @Test
    public void testHomePageHasRegisterCard() {
        driver.get(baseUrl);
        assertTrue(driver.getPageSource().contains("Register"));
    }

    @Test
    public void testHomePageHasLoginCard() {
        driver.get(baseUrl);
        assertTrue(driver.getPageSource().contains("Login"));
    }

    @Test
    public void testHomePageHasSearchTutorsCard() {
        driver.get(baseUrl);
        assertTrue(driver.getPageSource().contains("Search Tutors"));
    }

    @Test
    public void testRegisterPageLoads() {
        driver.get(baseUrl + "register.jsp");
        assertTrue(driver.getPageSource().contains("Register"));
    }

    @Test
    public void testLoginPageLoads() {
        driver.get(baseUrl + "login.jsp");
        assertTrue(driver.getPageSource().contains("Login"));
    }

    @Test
    public void testSearchTutorsPageLoads() {
        driver.get(baseUrl + "searchTutors.jsp");
        assertTrue(driver.getPageSource().contains("Search Tutors"));
    }

    @Test
    public void testCreateStudyGroupPageLoads() {
        driver.get(baseUrl + "createGroup.jsp");
        assertTrue(driver.getPageSource().contains("Create Study Group"));
    }

    @Test
    public void testCreateGroupFormFieldsExist() {
        driver.get(baseUrl + "createGroup.jsp");

        assertTrue(driver.findElement(By.name("title")).isDisplayed());
        assertTrue(driver.findElement(By.name("course_code")).isDisplayed());
        assertTrue(driver.findElement(By.name("description")).isDisplayed());
        assertTrue(driver.findElement(By.name("meeting_time")).isDisplayed());
        assertTrue(driver.findElement(By.name("location")).isDisplayed());
    }

    @Test
    public void testOptionalTutorDropdownExists() {
        driver.get(baseUrl + "createGroup.jsp");

        WebElement tutorDropdown = driver.findElement(By.name("tutor_id"));

        assertTrue(tutorDropdown.isDisplayed());
        assertEquals("select", tutorDropdown.getTagName());
    }
}