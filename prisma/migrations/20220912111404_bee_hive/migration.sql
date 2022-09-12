-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Books" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "librariesId" INTEGER NOT NULL,
    CONSTRAINT "Books_librariesId_fkey" FOREIGN KEY ("librariesId") REFERENCES "Libraries" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Books" ("author", "id", "librariesId", "price", "title") SELECT "author", "id", "librariesId", "price", "title" FROM "Books";
DROP TABLE "Books";
ALTER TABLE "new_Books" RENAME TO "Books";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
