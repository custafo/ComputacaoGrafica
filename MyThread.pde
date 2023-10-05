class MyThread extends Thread implements Runnable{
  Thread t;
  
  MyThread(){
    t = new Thread(this);
    t.start();
  }
  
  public void run(){
    while(true){
      redraw();
    }
  }
}
