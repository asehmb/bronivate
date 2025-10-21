using Microsoft.EntityFrameworkCore;

class QuoteDB: DbContext
{
    public QuoteDB(DbContextOptions<QuoteDB> options)
        : base(options) { }

    public DbSet<Quote> Quotes => Set<Quote>();
}