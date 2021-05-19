

function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}

function calculateIssueDate(fieldId) {
    var daysValue = Math.ceil(document.getElementById("issue_days").value * 1.2) + 1;
    var issueDateValue = new Date(document.getElementById("issue_startDate").value);


    var nameValue = addDays(issueDateValue, daysValue);

    if(nameValue.getDay() == 5) {
        nameValue = addDays(nameValue,2);
        document.getElementById("issue_issueDate").value = nameValue.toISOString().slice(0,10);
    }else if(nameValue.getDay() == 6) {
        ameValue = addDays(nameValue,2);
        document.getElementById("issue_issueDate").value = nameValue.toISOString().slice(0,10);
    }else {
        document.getElementById("issue_issueDate").value = nameValue.toISOString().slice(0,10);
    }
    
}