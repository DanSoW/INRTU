import java.util.Comparator;

class MaxX implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getX() < b.getX())
            return -1; 
        if (a.getX() == b.getX())
            return 0;
        return 1;
    }
}

class MinX implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getX() > b.getX())
            return -1; 
        if (a.getX() == b.getX())
            return 0;
        return 1;
    }
}

class MaxY implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getY() < b.getY())
            return -1; 
        if (a.getY() == b.getY())
            return 0;
        return 1;
    }
}

class MinY implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getY() > b.getY())
            return -1; 
        if (a.getY() == b.getY())
            return 0;
        return 1;
    }
}

class MaxZ implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getZ() < b.getZ())
            return -1; 
        if (a.getZ() == b.getZ())
            return 0;
        return 1;
    }
}

class MinZ implements Comparator<Penguin> {
    public int compare(Penguin a, Penguin b) {
        if (a.getZ() > b.getZ())
            return -1; 
        if (a.getZ() == b.getZ())
            return 0;
        return 1;
    }
}
