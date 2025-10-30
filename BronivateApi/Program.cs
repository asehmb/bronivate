using Google.Cloud.Firestore;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();



app.MapGet("/", () => "Hello World!");


app.MapGet("/quotes/get", async () =>
{
    FirestoreDb db = FirestoreDb.Create("bronivate");

    // Get the "quotes" collection
    CollectionReference quotesRef = db.Collection("quotes");
    QuerySnapshot snapshot = await quotesRef.GetSnapshotAsync();

    // Create a list to hold the results
    var quotesList = new List<Dictionary<string, object>>();

    foreach (DocumentSnapshot document in snapshot.Documents)
    {
        // Convert each Firestore document to a Dictionary
        quotesList.Add(document.ToDictionary());
    }

    return Results.Json(quotesList);


});

app.Run();

