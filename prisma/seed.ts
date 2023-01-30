import client from "../src/database/database";

async function main() {
    let raceTable = await client.races.findFirst();
    if (!raceTable) {
        raceTable = await client.races.create({
            data: [
                { name: "Dwarf" },
                { name: "Elf" },
                { name: "Halfling" },
                { name: "Human" },
                { name: "Dragonborn" },
                { name: "Gnome" },
                { name: "Half-Elf" },
                { name: "Half-Orc" },
                { name: "Tiefling" }
            ]
        });
    }

    let classTable = await client.class.findFirst();
    if (!classTable) {
        classTable = await client.class.create({
            data: [
                { name: "Barbarian" },
                { name: "Bard" },
                { name: "Cleric" },
                { name: "Druid" },
                { name: "Fighter" },
                { name: "Monk" },
                { name: "Paladin" },
                { name: "Ranger" },
                { name: "Rogue" },
                { name: "Sorcerer" },
                { name: "Warlock" },
                { name: "Wizard" }
            ]
        });
    }
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await client.$disconnect();
    });