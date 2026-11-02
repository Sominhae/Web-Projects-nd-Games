function showError(id, text) {
    document.getElementById(id).textContent = text;
    return false;
}

function validateLibrary() {
    const studentId = document.getElementById("studentId").value.trim();
    const bookName = document.getElementById("bookName").value.trim();
    const issueDate = document.getElementById("issueDate").value;

    if (!studentId || !bookName || !issueDate) {
        return showError("libraryMsg", "Please fill in all fields.");
    }
    return true;
}

function validateEvent() {
    const name = document.getElementById("participantName").value.trim();
    const email = document.getElementById("email").value.trim();
    const event = document.getElementById("eventType").value;

    if (!name || !email || !event) {
        return showError("eventMsg", "Please complete the registration form.");
    }
    if (!email.includes("@")) {
        return showError("eventMsg", "Enter a valid email address.");
    }
    return true;
}

function validateClinic() {
    const patient = document.getElementById("patientName").value.trim();
    const doctor = document.getElementById("doctor").value.trim();
    const date = document.getElementById("appointmentDate").value;

    if (!patient || !doctor || !date) {
        return showError("clinicMsg", "All appointment fields are required.");
    }
    return true;
}

function validateOrder() {
    const product = document.getElementById("productName").value.trim();
    const quantity = Number(document.getElementById("quantity").value);
    const price = Number(document.getElementById("price").value);

    if (!product || quantity <= 0 || price < 0) {
        return showError("orderMsg", "Enter valid product, quantity, and price.");
    }

    alert("Total price: " + (quantity * price).toFixed(2));
    return true;
}

function validateHostel() {
    const studentId = document.getElementById("hostelStudentId").value.trim();
    const roomType = document.getElementById("roomType").value;

    if (!studentId || !roomType) {
        return showError("hostelMsg", "Student ID and room type are required.");
    }
    return true;
}
