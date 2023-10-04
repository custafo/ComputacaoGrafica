class MyThread extends Thread implements Runnable{
  
  Thread thread;
  
  MyThread(){
    thread = new Thread(this);
    thread.start();
  }
  
  @Override
  public void run(){
    while(true)
    {
      redraw();
    }
  }
}
